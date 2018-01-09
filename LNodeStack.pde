import java.util.*;

class LNodeStack<E>{

    LNode<E> front;

    LNodeStack(){
      front = null;
    }

    boolean isEmpty(){
      return front == null;
    }

    void push(E o){
      LNode<E> n = new LNode<E>(o);
      if (isEmpty()){
        front = n;
      }
      else{
        n.setNext(front);
        front = n;
      }
    }

    E pop(){
      if (isEmpty()){
        throw new NoSuchElementException("UnderflowException"); //Courtesy of Java Documentation
      }
      LNode<E> popped = front;
      front = popped.getNext();
      return popped.getData();
    }

    E peek(){
      if (isEmpty()){
        throw new NoSuchElementException("UnderflowException");
      }
      return front.getData();
    }  
}
