"use client";
import {Typography, Box} from "@mui/material";

export default function AboutPage() {
    return (
        <Box>
            <Typography variant="h4" gutterBottom>
                About Me
            </Typography>
            <Typography variant="body1" color="text.secondary">
                Hi, I’m Daniel Tate, a full-stack developer passionate about building intelligent systems and elegant
                interfaces.
            </Typography>
        </Box>
    );
}