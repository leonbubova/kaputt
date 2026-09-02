import Link from "next/link";

// nested layout: wraps every page under /dashboard
export default function DashboardLayout({ children }: { children: React.ReactNode }) {
  return (
    <div>
      <nav data-testid="dashboard-nav">
        <Link href="/dashboard">Overview</Link> <Link href="/dashboard/settings">Settings</Link>
      </nav>
      {children}
    </div>
  );
}
