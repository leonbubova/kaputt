## 1
Start the dev server (`npm run dev`) and `curl -i localhost:3100/api/health`. Then read the terminal running the dev server — Next.js tells you exactly what it dislikes about the route file.
## 2
A Route Handler is matched by the *name* of its export: `GET`, `POST`, `PUT`… Names are case-sensitive.
## 3
`src/app/api/health/route.ts`: rename `export async function get` → `export async function GET`.
