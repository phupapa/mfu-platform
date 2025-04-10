import * as z from "zod";
export const registerSchema = z.object({
  username: z.string().min(4, {
    message: "Enter a valid username",
  }),
  password: z.string().min(6, {
    message: "Password must be at least 6 characters",
  }),
  role: z.enum(["admin", "user"]).default("user"),
});
