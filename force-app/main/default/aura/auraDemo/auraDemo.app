<aura:application extends="force:slds" >
    <c:AuraStyling/>
    <hr/>
    <aura:attribute name="val1" type="string" default="sathya"/>
    <aura:attribute name="val2" type="string" default=" rupa"/>
    Hello, This is {!v.val1} {!v.val2}
    <br/>
    <c:MathCalculator/>
    <!--<c:AuraApexConnectorDemo/>
    <hr/>
    <c:auraDemo1/>
    <hr/>
    <c:parentAura/>
    c:auraDemo2/>-->
</aura:application>