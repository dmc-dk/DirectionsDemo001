pageextension 50142 SalesExtension extends "Sales Order"
{
    layout
    {
        addafter("Sell-to Customer Name")
        {
            field("IsDirection2024Customer"; rec."Sell-to IsDirectionsPart.")
            {
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Is the customer a participant in the Directions 2024 conference?';
            }
        }
    }
}
