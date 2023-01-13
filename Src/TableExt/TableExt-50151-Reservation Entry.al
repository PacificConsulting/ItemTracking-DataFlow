tableextension 50151 ReservEntryExt extends "Reservation Entry"
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