codeunit 50151 "New Functions"
{
    trigger OnRun()
    begin

    end;

    procedure ExistingSellStatus(ItemNo: Code[20]; VariantCode: Code[20]; LotNo: Code[20]; SerialNo: Code[20]; testMultiple: Boolean; var EntriesExist: Boolean) SellStatus: option " ",BagPack,Display;
    var
        ItemTrackMgt: Codeunit 6500;
        ILE: Record "Item Ledger Entry";
        ItemTracingMgt: Codeunit "Item Tracing Mgt.";
    Begin
        IF not ItemTrackMgt.GetLotSNDataSet(ItemNo, VariantCode, LotNo, SerialNo, ILE) then begin
            EntriesExist := false;
            exit;
        end;
        EntriesExist := true;
        SellStatus := ILE."Sell Status";
        IF testMultiple AND ItemTracingMgt.SpecificTracking(ItemNo, SerialNo, LotNo) then begin
            ILE.SetFilter("Sell Status", '<>%1', ILE."Sell Status");
            ILE.SetRange(Open, true);
            if not ILE.IsEmpty then
                Error('%1 Not Found!', LotNo);
        end;
    End;

    procedure AddSellStatus(SellStatus: option " ",BagPack,Display)
    var
        ReservEntry: Record "Reservation Entry";
    Begin
        ReservEntry."Sell Status" := SellStatus;
    End;

    var
        myInt: Integer;
}