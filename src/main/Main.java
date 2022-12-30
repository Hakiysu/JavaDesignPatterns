package main;

import agent.CilentFrame;
import main.loginFrame.*;

public class Main {
    public static void main(String[] args) throws Exception {
        new loginFrame().init();
        CilentFrame f = new CilentFrame();
    }
}
