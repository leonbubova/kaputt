`process-refund.ts` was copy-pasted and still has `id: "process-order"`.
    sed -i 's/id: "process-order"/id: "process-refund"/' src/trigger/process-refund.ts
