import type {Metadata} from "next";
import {Geist, Geist_Mono} from "next/font/google";
import "../styles/globals.css";
import {CssBaseline, Container} from "@mui/material";
import NavBar from "../components/NavBar"; // 你自己写的导航栏

const geistSans = Geist({
    variable: "--font-geist-sans",
    subsets: ["latin"],
});

const geistMono = Geist_Mono({
    variable: "--font-geist-mono",
    subsets: ["latin"],
});

export const metadata: Metadata = {
    title: "Daniel Tate – Personal Website",
    description: "Welcome to my site!",
};

export default function RootLayout({
                                       children,
                                   }: Readonly<{
    children: React.ReactNode;
}>) {
    return (
        <html lang="en">
        <body
            className={`${geistSans.variable} ${geistMono.variable} antialiased`}
        >
        <CssBaseline/>
        <NavBar/>
        <Container sx={{mt: 4}}>{children}</Container>
        </body>
        </html>
    );
}