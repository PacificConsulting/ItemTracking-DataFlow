pageextension 50151 ItemTrackingLinesExt extends "Item Tracking Lines"
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