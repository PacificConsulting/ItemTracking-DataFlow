pageextension 50153 ValueEntryExt extends "Value Entries"
{
    layout
    {
        addafter("External Document No.")
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