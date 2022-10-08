package org.koz.wallet.security.jwt.model;

public enum PermissionTypes {
    ADD_WALLET("ADD_WALLET"),
    EDIT_WALLET("EDIT_WALLET"),
    VIEW_WALLET("VIEW_WALLET"),
    ;

    private final String dictionaryCode;

    PermissionTypes(String dictionaryCode) {
        this.dictionaryCode = dictionaryCode;
    }

    public String getDictionaryCode() {
        return dictionaryCode;
    }
}