using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Lab06
{
    public class Customer
    {
        private string _FirstName;
        private string _LastName;
        private string _Email;
        private string _Message;
     

        public Customer(string FirstName, string LastName, string Email, string Message)
        {
            _FirstName = FirstName;
            _LastName = LastName;
            _Email = Email;
            _Message = Message;
          
        }

        public Customer()
        {
        }

        public string FirstName
        {
            get { return _FirstName; }
            set { _FirstName = value; }
        }
        public string LastName
        {
            get { return _LastName; }
            set { _LastName = value; }
        }
        public string Email
        {
            get { return _Email; }
            set { _Email = value; }
        }
        public string Message
        {
            get { return _Message; }
            set { _Message = value; }
        }
       

    }
}