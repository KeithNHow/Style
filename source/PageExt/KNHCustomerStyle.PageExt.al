/// <summary>
/// PageExtension KNH Customer Style (ID 52040) extends Record Customer List.
/// </summary>
pageextension 52060 "KNHCustomerStyle" extends "Customer List"
{
    layout
    {
        modify(Name)
        {
            StyleExpr = MyStyle;
        }
    }

    trigger OnOpenPage()
    begin
        SetStyle();
    end;

    trigger OnAfterGetCurrRecord()
    begin
        SetStyle();
    end;

    var
        MyStyle: Text;

    local procedure SetStyle()
    begin
        case Rec."Gen. Bus. Posting Group" of
            'Domestic':
                MyStyle := 'Unfavorable';
            'EU':
                MyStyle := 'Favorable';
            'Export':
                MyStyle := 'Ambiguous';
        end;
    end;
}
