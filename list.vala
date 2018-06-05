class Node : GLib.Object { 

    public int value;
    public Node next;

    public Node(int? value, Node? next) {
        this.value = value;
        this.next = next;
    }

    public string ToString() {
        return this.value.to_string();
    }
}

class LinkedList : GLib.Object { 

    private Node first = null;
    private Node last = null;
    private int length = 0;

    public LinkedList() {
        //  this.first = first;
        //  this.last = last;
        //  this.length = length;
    }

    public string ToString() {
        if (this.first != null) {
            Node current = this.first;
            string res = "Linked List: { " + current.ToString() + " ";
            while (current.next != null) {
                current = current.next;
                res += current.ToString() + " ";
            }
            return res + "}\n";
        }
        return "Linked List: {}";
    }

    public void Add(int num) {
        this.length += 1;
        if (this.first == null) {
            this.last = this.first = new Node(num, null);
        } else {
            this.last.next = this.last = new Node(num, null);
        }
    }

    public int GetLength() {
        return length;
    }

    public void push(int num) {
        this.length += 1;
        if (this.first == null) {
            this.last = this.first = new Node(num, null);
        } else {
            this.first = new Node(num, this.first);
        }
    }

    public void InsertNth(int i, int n) {
        this.length += 1;
        if (this.first == null) {
            this.last = this.first = new Node(n, null);
            return;
        }
        if (i == 0) {
            this.first = new Node(n, this.first);
            return;
        }
        Node curr = this.first;
        int count = 0;
        while (curr != null) {
            count += 1;
            if (count == i) {
                curr.next = new Node(n, curr.next);
                if (curr.next.next == null) {
                    this.last = curr.next;
                }
                break;
            }
            curr = curr.next;
        }
    }

    public void Del(int i) {
        Node old = this.first;
        if (this.first == null) {
            return;
        }
        Node curr = this.first;
        int count = 0;
        if (i == 0) {
            this.first = this.first.next;
            return;
        }
        this.length -= 1;
        while (curr != null) {
            if (count == i) {
                if (curr.next == null) {
                    this.last = curr;
                }
                old.next = curr.next;
                break;
            }
            old = curr;
            curr = curr.next;
            count += 1;
        }
    }

    public void SortedInsert(int x) {
        this.length += 1;
        if (this.first == null) {
            this.first = new Node(x, this.last);
            return;
        }
        if (this.first.value > x) {
            this.first = new Node(x, this.first);
            return;
        }
        Node curr = this.first;
        Node old = this.first;
        while (curr != null) {
            if (curr.value > x) {
                old.next = new Node(x, curr);
                return;
            }
            old = curr;
            curr = curr.next;
        }
        this.last = old.next = new Node(x, null);
    }

    public void RemoveDuplicates() {
        if (this.first == null) {
            return;
        }
        Node old = this.first;
        Node curr = this.first;
        while (curr != null) {
            if (curr.next != null) {
                if (old.value == curr.next.value) {
                    curr.next = curr.next.next;
                    this.length -= 1;
                }
            } else {
                old = old.next;
                curr = old.next;
            }
            curr = curr.next;
        }
    }

    public void RemoveSortedDuplicates() {
        if (this.first == null) {
            return;
        }
        Node curr = this.first;
        while (curr != null) {
            int _del = 0;
            if (curr.next != null) {
                if (curr.value == curr.next.value) {
                    curr.next = curr.next.next;
                    _del = 1;
                    this.length -= 1;
                }
            }
            if (_del == 0) {
                curr = curr.next;
            }
        }
    }

    public void BubbleSort() {
        Node a = new Node(0, null);
        Node b = new Node(0, null);
        Node c = new Node(0, null);
        Node e = new Node(0, null);
        Node tmp = new Node(0, null);

        while (e != this.first.next) {
            c = a = this.first;
            b = a.next;

            while (a != e) {
                if ((a != null) && (b != null)) {
                    if (a.value > b.value) {
                        if (a == this.first) {
                            tmp = b.next;
                            b.next = a;
                            a.next = tmp;
                            this.first = b;
                            c = b;
                        } else {
                            tmp = b.next;
                            b.next = a;
                            a.next = tmp;
                            c.next = b;
                            c = b;
                        }
                    } else {
                        c = a;
                        a = a.next;
                    }
                    b = a.next;
                    if (b == e) {
                        e = a;
                    }
                } else {
                    e = a;
                }
            }
        }
    }
}

public static int main(string[] args) {
    var L = new LinkedList();

    L.Add(1);
    L.Add(2);
    L.Add(3);
    L.Add(4);
    L.Add(42);
    L.push(0);
    L.InsertNth(1, 11);
    L.Del(2);
    L.BubbleSort();
    L.SortedInsert(5);
    L.Add(42);
    L.RemoveSortedDuplicates();

    stdout.printf(L.ToString());
    print("Length of the list is: %d\n", L.GetLength());
    return 0;
}