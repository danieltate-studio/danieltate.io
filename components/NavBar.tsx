"use client";
import { AppBar, Toolbar, Typography, Button, Stack } from "@mui/material";
import Link from "next/link";

export default function NavBar() {
    return (
        <AppBar position="static">
            <Toolbar>
                <Typography variant="h6" sx={{ flexGrow: 1 }}>
                    Daniel Tate
                </Typography>
                <Stack direction="row" spacing={2}>
                    <Button color="inherit" component={Link} href="/about">
                        About Me
                    </Button>
                    <Button color="inherit" component={Link} href="/projects">
                        Projects
                    </Button>
                    <Button color="inherit" component={Link} href="/stack">
                        Tech Stacks
                    </Button>
                </Stack>
            </Toolbar>
        </AppBar>
    );
}