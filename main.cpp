#include "user.pb.h"
#include <iostream>
using namespace std;
int main() {
	tutorial::Person p;
	p.set_id(123);
	p.set_name("bob");
	p.set_email("asd@abc.com");
	cout << "p= *********" << endl << p.DebugString() << endl;
	string ser = p.SerializeAsString();
	cout << "serialized=[" << ser << "]" << endl;
	tutorial::Person p2;
	p2.ParseFromString(ser);
	cout << "deserialized= *********" << endl << p2.DebugString() << "]" << endl;
}