package org.example;

public class Stack {
    private Element current;

    public void push(Element e){
        if (current != null) {
            e.setNext(current);
        }

        current = e;
    }

    public Element top(){
        return current;
    }

    public boolean pop() {
        if (current == null) {
            return false;
        }

        current = current.getNext();
        return true;
    }

    public void print() {
        if (current == null) {
            System.out.println("print - Stack is empty");
            return;
        }

        System.out.print("print - Stack contains: ");
        Element e = current;
        while (e != null) {
            System.out.print(e.getValue() + "");
            e = e.getNext();
        }

        System.out.print("top element = " + current.getValue() + "\n");
    }

    public boolean isEmpty() {
        return current == null;
    }

    public int size() {
        int size = 0;
        Element e = current;
        while (e != null) {
            size++;
            e = e.getNext();
        }
        return size;
    }

    // Clear kann Sinn machen, da mit der Referenz auf den Stack weitergearbeitet werden kann.
    public void clear() {}
}
