import { Counter } from "@/components/Counter";

export const metadata = { title: "Dashboard" };

export default function Dashboard() {
  return (
    <section>
      <h1>Dashboard</h1>
      <Counter />
    </section>
  );
}
