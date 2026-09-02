"use server";

export async function subscribe(formData: FormData) {
  const email = String(formData.get("email") ?? "").trim();
  console.log("newsletter:", email);
}
