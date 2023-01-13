pageextension 50150 ItemLedgerEntriesExt extends "Item Ledger Entries"
{
    layout
    {
        addafter("Expiration Date")
        {
            field("Sell Status"; Rec."Sell Status")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}