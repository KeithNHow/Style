/// <summary>
/// PageExtension extends Record Customer List. It changes the style of the field Name based on the value of the field Gen. Bus. Posting Group.
/// </summary>
pageextension 52060 KNHCustomerStyle extends "Customer List"
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
        this.SetStyle();
    end;

    trigger OnAfterGetCurrRecord()
    begin
        this.SetStyle();
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
