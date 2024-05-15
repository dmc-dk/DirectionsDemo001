namespace DefaultPublisher.DirectionsCustomers;

using Microsoft.Sales.Customer;
using Microsoft.Sales.Document;

tableextension 50142 DirectionsCustomerSalesOrder extends "Sales Header"
{
    fields
    {
        field(50140; "Sell-to IsDirectionsPart."; Boolean)
        {
            Caption = 'Direction 2024 Participant';
        }
    }
}