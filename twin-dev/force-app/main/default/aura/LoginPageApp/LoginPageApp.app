<!--aura:application access="GLOBAL" extends="force:slds">
    <c:LoginPageComp/>
</aura:application-->

<aura:application access="GLOBAL" extends="ltng:outApp" implements="ltng:allowGuestAccess">
    <aura:dependency resource="c:LoginPageComp"/>
</aura:application>