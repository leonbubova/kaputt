Ask Redis for the type, then store the answer.
    TYPE legacy:blob        → set
    SET audit:legacy:type set
