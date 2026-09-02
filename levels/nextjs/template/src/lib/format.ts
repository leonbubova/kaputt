export function formatPrice(eur: number): string {
  return `${eur.toFixed(2).replace(".", ",")} €`;
}
