tableextension 50152 ItemJnlLineExt extends "Item Journal Line"
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