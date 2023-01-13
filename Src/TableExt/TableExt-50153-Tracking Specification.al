tableextension 50153 TrackSpecExt extends "Tracking Specification"
{
    fields
    {
        field(50150; "Sell Status"; Option)
        {
            OptionMembers = " ",Backpack,Display;
            OptionCaption = ' ,Backpack,Display';
        }
        modify("Lot No.")
        {
            trigger OnAfterValidate()
            begin
                InitSellStatus();
            end;
        }
    }
    procedure InitSellStatus()
    var
        SellStaus: Option;
        CU50151: Codeunit 50151;
        EntriesExist: Boolean;
    Begin
        if ("Serial No." = xRec."Serial No.") AND ("Lot No." = xRec."Lot No.") then
            exit;
        "Sell Status" := Rec."Sell Status"::" ";
        SellStaus := CU50151.ExistingSellStatus("Item No.", "Variant Code", "Lot No.", "Serial No.", false, EntriesExist);
        if EntriesExist then
            "Sell Status" := SellStaus;
    End;

    var
        myInt: Integer;
}