package org.koz.wallet.app.transaction.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class TransactionCategory {
    private Long id;
    private Long userId;
    private String name;
    private String keywords;
}
