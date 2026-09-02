// in-memory guestbook — lives as long as the server process
const entries: string[] = [];

export function getEntries(): string[] {
  return entries;
}

export function addGuest(name: string) {
  entries.push(name);
}
