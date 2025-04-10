import React, { useState } from "react";
import AuthForm from "./AuthComponents/AuthForm";
import TextField from "@mui/material/TextField";
import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import {
  Form,
  FormControl,
  FormField,
  FormItem,
  FormMessage,
} from "@/components/ui/form";

import { Button } from "@/components/ui/button";
import { cn } from "@/lib/utils";
import { loginSchema } from "../../types/loginschema";
import { LoginUser } from "../../EndPoints/auth";
import { toast } from "sonner";
import { useNavigate } from "react-router-dom";
import { useDispatch } from "react-redux";
import { setUser } from "../../store/Slices/UserSlice";

const Login = () => {
  const [istwostep, setIstwostep] = useState(false);
  const navigate = useNavigate();
  const form = useForm({
    resolver: zodResolver(loginSchema),
    defaultValues: {
      username: "",
      password: "",
    },
  });

  const [loading, setLoading] = useState(false);
  const dispatch = useDispatch();
  const loginOnsubmit = async (values) => {
    try {
      setLoading(true);
      const response = await LoginUser(values);

      if (response.isSuccess) {
        form.reset();
        toast.success(response.message);

        localStorage.setItem("token", response.token);
        dispatch(setUser(response.loginUser));
        navigate("/");
      } else {
        form.reset();
        toast.error(response.message);
      }
    } catch (error) {
      toast.error(error.message);
    } finally {
      setLoading(false);
    }
  };

  return (
    <div>
      <AuthForm
        label_1={"LOGIN"}
        label_2={"REGISTER"}
        herf_1={"/auth/login"}
        herf_2={"/auth/register"}
        label_3={"Cannot login?"}
        label_4={"Contact admin team via phone"}
        showProvider={true}
        isloginPage={true}
      >
        <Form {...form}>
          <form
            onSubmit={form.handleSubmit(loginOnsubmit)}
            className="px-2 flex flex-col gap-2"
          >
            <div className="flex flex-col gap-7">
              <FormField
                control={form.control}
                name="username"
                render={({ field }) => (
                  <FormItem>
                    <FormControl>
                      <TextField
                        id="outlined-basic"
                        label="Username"
                        placeholder="john doe"
                        {...field}
                        variant="outlined"
                        className="w-full rounded-lg text-md bg-white"
                      />
                    </FormControl>
                    <FormMessage />
                  </FormItem>
                )}
              />
              <FormField
                control={form.control}
                name="password"
                render={({ field }) => (
                  <FormItem>
                    <FormControl>
                      <TextField
                        id="outlined-basic"
                        label="Password"
                        placeholder="******"
                        {...field}
                        type="password"
                        {...field}
                        variant="outlined"
                        className="w-full rounded-lg text-md bg-white"
                      />
                    </FormControl>
                    <FormMessage />
                  </FormItem>
                )}
              />
            </div>

            <Button
              type="submit"
              disabled={loading}
              className={cn("w-full h-12 bg-customGreen my-4 text-[18px]")}
            >
              {loading
                ? istwostep
                  ? "Verifying"
                  : "Logging in"
                : istwostep
                ? "Verify"
                : "Login"}
            </Button>
          </form>
        </Form>
      </AuthForm>
    </div>
  );
};

export default Login;
