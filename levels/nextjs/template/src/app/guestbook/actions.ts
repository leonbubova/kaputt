"use server";

import { revalidatePath } from "next/cache";
import { addGuest } from "@/lib/guestbook";

export async function signGuestbook(formData: FormData) {
  const name = String(formData.get("name") ?? "").trim();
  if (name) addGuest(name);
  revalidatePath("/guestbook");
}
