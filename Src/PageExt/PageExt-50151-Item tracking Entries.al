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
        modify("Lot No.")
        {
            trigger OnAssistEdit()
            begin
                IF Rec."Source Type" = 5407 THEN BEGIN
                    ILE_.RESET;
                    ILE_.SETRANGE("Lot No.", Rec."Lot No.");
                    IF ILE_.FINDFIRST THEN BEGIN
                        Rec."Sell Status" := ILE_."Sell Status";
                    END;
                END;

                IF Rec."Source Type" = 37 THEN BEGIN
                    ILE_.RESET;
                    ILE_.SETRANGE("Lot No.", Rec."Lot No.");
                    IF ILE_.FINDFIRST THEN BEGIN
                        Rec."Sell Status" := ILE_."Sell Status";
                    END;
                END;
            end;
        }
    }

    actions
    {
        // Add changes to page actions here 
    }

    var
        myInt: Integer;
        ILE_: Record "Item Ledger Entry";
}