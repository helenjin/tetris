import java.util.*;

class Queue<E>{

  LNode<E> front;
  LNode<E> back;

  Queue(){
    front = null;
    back = null;
  }

  boolean isEmpty(){
    return front == null;
  }

  E peek(){
    if (isEmpty()){
      throw new NoSuchElementException("Queue Underflow");
    }
    return front.getData();
  }

  void enQueue(E o){
    LNode<E> added = new LNode<E>(o);
    if (isEmpty()){
      front = added;
      back = added;
    }
    else{
      back.setNext(added);
      back = added;
    }
  }

  E deQueue(){
    if (isEmpty()){
      throw new NoSuchElementException("Queue underflow");
    }
    E ret = front.getData();
    front = front.getNext();
    if (isEmpty()){
      back = null;
    }
    return ret;
  }

}
