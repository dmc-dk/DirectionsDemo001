codeunit 50141 DirectionsCustomerManagement
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document", 'OnAfterReleaseSalesDoc', '', true, true)]
    local procedure "Check Discount During Release"(var SalesHeader: Record "Sales Header")
    var
        ConfirmInvoicePctLbl: Label 'Directions participants have a recommended discount of 20%. Current discount is calculated at %1.';
    begin
        // Check if the customer is a participant in the Directions 2024 conference
        if SalesHeader."Sell-to IsDirectionsPart." then
            if (SalesHeader."Invoice Discount Value" < 20) then
                Message(ConfirmInvoicePctLbl, Round(SalesHeader."Invoice Discount Value"));
    end;

    // Event subscriber for copying the IsDirectionsPart field from the customer to the sales header
    [EventSubscriber(ObjectType::Table, Database::"Sales Header", OnAfterCopySellToCustomerAddressFieldsFromCustomer, '', false, false)]
    local procedure "Sales Header_OnAfterCopySellToCustomerAddressFieldsFromCustomer"(var SalesHeader: Record "Sales Header"; SellToCustomer: Record Customer; CurrentFieldNo: Integer; var SkipBillToContact: Boolean; var SkipSellToContact: Boolean)
    begin
        // Copy the IsDirectionsPart field from the customer to the sales header
        SalesHeader."Sell-to IsDirectionsPart." := SellToCustomer.IsDirection2024Customer;
    end;

}