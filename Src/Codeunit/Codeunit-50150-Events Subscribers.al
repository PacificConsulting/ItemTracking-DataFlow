codeunit 50150 "Events Subscribers"
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Page, Page::"Item Tracking Lines", 'OnRegisterChangeOnChangeTypeInsertOnBeforeInsertReservEntry', '', false, false)]
    local procedure OnRegisterChangeOnChangeTypeInsertOnBeforeInsertReservEntry(var TrackingSpecification: Record "Tracking Specification"; var OldTrackingSpecification: Record "Tracking Specification"; var NewTrackingSpecification: Record "Tracking Specification"; FormRunMode: Option);
    var
        CU50151: Codeunit 50151;
    begin
        Cu50151.AddSellStatus(NewTrackingSpecification."Sell Status");
    end;

    [EventSubscriber(ObjectType::Page, Page::"Item Tracking Lines", 'OnAfterCopyTrackingSpec', '', false, false)]
    local procedure OnAfterCopyTrackingSpec(var SourceTrackingSpec: Record "Tracking Specification"; var DestTrkgSpec: Record "Tracking Specification");
    begin
        DestTrkgSpec."Sell Status" := SourceTrackingSpec."Sell Status";
    end;

    [EventSubscriber(ObjectType::Page, Page::"Item Tracking Lines", 'OnRegisterChangeOnBeforeAddItemTrackingToTempRecSet', '', false, false)]
    local procedure OnRegisterChangeOnBeforeAddItemTrackingToTempRecSet(var OldTrackingSpecification: Record "Tracking Specification"; var NewTrackingSpecification: Record "Tracking Specification"; CurrentSignFactor: Integer; var TempReservEntry: Record "Reservation Entry");
    begin
        OldTrackingSpecification."Sell Status" := NewTrackingSpecification."Sell Status"::" ";
    end;

    [EventSubscriber(ObjectType::Page, Page::"Item Tracking Lines", 'OnAfterEntriesAreIdentical', '', false, false)]
    local procedure OnAfterEntriesAreIdentical(ReservEntry1: Record "Reservation Entry"; ReservEntry2: Record "Reservation Entry"; var IdenticalArray: array[2] of Boolean);
    begin
        ReservEntry1."Sell Status" := ReservEntry2."Sell Status";
    end;

    [EventSubscriber(ObjectType::Page, Page::"Item Tracking Lines", 'OnRegisterItemTrackingLinesOnAfterReclass', '', false, false)]
    local procedure OnRegisterItemTrackingLinesOnAfterReclass(var TrackingSpecification: Record "Tracking Specification"; TempTrackingSpecification: Record "Tracking Specification");
    begin
        TrackingSpecification."Sell Status" := TempTrackingSpecification."Sell Status";
    end;

    [EventSubscriber(ObjectType::Page, Page::"Item Tracking Lines", 'OnAfterMoveFields', '', false, false)]
    local procedure OnAfterMoveFields(var TrkgSpec: Record "Tracking Specification"; var ReservEntry: Record "Reservation Entry");
    begin
        ReservEntry."Sell Status" := TrkgSpec."Sell Status";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnSetupTempSplitItemJnlLineOnBeforeCalcPostItemJnlLine', '', false, false)]
    local procedure OnSetupTempSplitItemJnlLineOnBeforeCalcPostItemJnlLine(var TempSplitItemJnlLine: Record "Item Journal Line"; TempTrackingSpecification: Record "Tracking Specification");
    begin
        TempSplitItemJnlLine."Sell Status" := TempTrackingSpecification."Sell Status";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnAfterInitItemLedgEntry', '', false, false)]
    local procedure OnAfterInitItemLedgEntry(var NewItemLedgEntry: Record "Item Ledger Entry"; var ItemJournalLine: Record "Item Journal Line"; var ItemLedgEntryNo: Integer);
    begin
        NewItemLedgEntry."Sell Status" := ItemJournalLine."Sell Status";
    end;

    [EventSubscriber(ObjectType::Page, Page::"Item Tracking Lines", 'OnBeforeAddToGlobalRecordSet', '', false, false)]
    local procedure OnBeforeAddToGlobalRecordSet(var TrackingSpecification: Record "Tracking Specification"; EntriesExist: Boolean; CurrentSignFactor: Integer; var TempTrackingSpecification: Record "Tracking Specification");
    Var
        SellStatus: option " ",BagPack,Display;
        CU50151: Codeunit 50151;
    begin
        sellstatus := CU50151.ExistingSellStatus(TrackingSpecification."Item No.", TrackingSpecification."Variant Code", TrackingSpecification."Lot No.", TrackingSpecification."Serial No.", False, EntriesExist);
        if SellStatus <> SellStatus::" " then
            TrackingSpecification."Sell Status" := SellStatus;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnInitValueEntryOnAfterAssignFields', '', false, false)]
    local procedure OnInitValueEntryOnAfterAssignFields(var ValueEntry: Record "Value Entry"; ItemLedgEntry: Record "Item Ledger Entry"; ItemJnlLine: Record "Item Journal Line");
    begin
        ValueEntry."Sell Status" := ItemLedgEntry."Sell Status";
    end;

    var
        myInt: Integer;
}