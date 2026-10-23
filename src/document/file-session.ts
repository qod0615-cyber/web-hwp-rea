/** Document file association: native Save vs Save As, commit only after a completed write. */
export interface DocumentFileHandle {
  name: string;
  getFile(): Promise<File>;
  createWritable(): Promise<{ write(data: Uint8Array): Promise<void>; close(): Promise<void>; abort?(): Promise<void> }>;
}
interface FilePickerHost {
  showOpenFilePicker?: (options: object) => Promise<DocumentFileHandle[]>;
  showSaveFilePicker?: (options: object) => Promise<DocumentFileHandle>;
}
const fileTypes = [{ description: '한글 표준 문서', accept: { 'application/hwp+zip': ['.hwpx'] } }];

export class DocumentFileSession {
  private associated: DocumentFileHandle | null = null;
  get name(): string | null { return this.associated?.name || null; }
  reset() { this.associated = null; }
  associate(handle: DocumentFileHandle | null) { this.associated = handle; }

  async chooseOpen(): Promise<{ file: File; handle: DocumentFileHandle | null } | null> {
    const host = window as unknown as FilePickerHost;
    if (host.showOpenFilePicker) {
      try {
        const [handle] = await host.showOpenFilePicker({ types: fileTypes, multiple: false });
        if (!handle) return null;
        return { file: await handle.getFile(), handle };
      } catch (error) {
        if ((error as DOMException).name === 'AbortError') return null;
        throw error;
      }
    }
    return new Promise(resolve => {
      const input = document.createElement('input');
      input.type = 'file'; input.accept = '.hwpx';
      input.addEventListener('change', () => resolve(input.files?.[0] ? { file: input.files[0], handle: null } : null), { once: true });
      input.addEventListener('cancel', () => resolve(null), { once: true });
      input.click();
    });
  }

  async save(bytes: Uint8Array, suggestedName: string, saveAs = false): Promise<{ name: string; associated: boolean } | null> {
    const host = window as unknown as FilePickerHost;
    let handle = saveAs ? null : this.associated;
    if (!handle && host.showSaveFilePicker) {
      try {
        handle = await host.showSaveFilePicker({ suggestedName: suggestedName.replace(/(?:\.hwpx)?$/i, '.hwpx'), types: fileTypes });
      } catch (error) {
        if ((error as DOMException).name === 'AbortError') return null;
        throw error;
      }
    }
    if (handle) {
      const writable = await handle.createWritable();
      try { await writable.write(bytes); await writable.close(); }
      catch (error) { try { await writable.abort?.(); } catch {} throw error; }
      this.associated = handle;
      return { name: handle.name, associated: true };
    }
    const name = suggestedName.replace(/(?:\.hwpx)?$/i, '.hwpx');
    const blob = new Blob([bytes as BlobPart], { type: 'application/hwp+zip' });
    const url = URL.createObjectURL(blob);
    const link = document.createElement('a'); link.href = url; link.download = name; link.click();
    setTimeout(() => URL.revokeObjectURL(url), 1000);
    return { name, associated: false };
  }
}
