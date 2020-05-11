package ch.digitalfondue.nihttpsuiteexample;

import ch.digitalfondue.nihttpsuite.Server;

import java.io.IOException;

public class App {
    public static void main(String[] args) throws IOException, InterruptedException {
        Server.configure().listenerPort(8080)
                .route()
                .get("/", (req, res) -> {res.ok().html("hello world!");})
                .build()
                .start();
    }
}
