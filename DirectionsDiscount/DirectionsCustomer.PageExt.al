pageextension 50141 DirectionsCustomer extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field("IsDirection2024Customer"; Rec.IsDirection2024Customer)
            {
                ApplicationArea = All;
                ToolTip = 'Check this box if the customer is a participant in the Directions 2024 conference.';
            }
        }
    }
}