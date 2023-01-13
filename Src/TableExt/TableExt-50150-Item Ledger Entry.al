tableextension 50150 ILEExt extends "Item Ledger Entry"
{
    fields
    {
        field(50150; "Sell Status"; Option)
        {
            OptionMembers = " ",Backpack,Display;
            OptionCaption = ' ,Backpack,Display';
        }
    }

    var
        myInt: Integer;
}