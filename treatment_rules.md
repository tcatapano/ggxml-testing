# Rules for Valid GGXML Treatment

## Illegal Nesting

### 1.1 A treatment element should not contain another treatment element
Severity: Error

XPath: `treatment[descendant::treatment]`

### 1.2 A materialsCitation element should not contain another materialsCitation element 
Severity: Error

XPath: `materialsCitation[descendant::materialsCitation]`

### 1.3 A treatmentCitation element should not contain another treatmentCitation element 
Severity: Error

XPath: `treatmentCitation[descendant::treatmentCitation]`

### 1.4 A figureCitation element should not contain another figureCitation element 
Severity: Error

XPath: `figureCitation[descendant::figureCitation]`

### 1.5 A bibrefCitation element should not contain another bibrefCitation element 
Severity: Error

XPath: `bibRefCitation[descendant::bibRefCitation]`

        
