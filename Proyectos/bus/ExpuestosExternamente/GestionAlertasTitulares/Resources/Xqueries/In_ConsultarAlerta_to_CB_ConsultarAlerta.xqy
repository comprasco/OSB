xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/cb/gestionalertastitulares/consultaralerta/v1";
(:: import schema at "../Schemas/Legacy/CB_GAT_ConsultarAlerta.xsd" ::)
declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/ee/gestionalertastitulares/consultaralerta/v1";
(:: import schema at "../Schemas/EE_GAT_ConsultarAlerta.xsd" ::)

declare variable $payloadRequest as element() (:: schema-element(ns1:entradaConsultarAlerta) ::) external;

declare function local:func($payloadRequest as element() (:: schema-element(ns1:entradaConsultarAlerta) ::)) as element() (:: schema-element(ns2:entradaConsultarAlerta) ::) {
    <ns2:entradaConsultarAlerta>
        <ns2:modulo>{fn:data($payloadRequest/ns1:modulo)}</ns2:modulo>
        {
            if ($payloadRequest/ns1:departamento)
            then <ns2:departamento>{fn:data($payloadRequest/ns1:departamento)}</ns2:departamento>
            else ()
        }
        {
            if ($payloadRequest/ns1:municipio)
            then <ns2:municipio>{fn:data($payloadRequest/ns1:municipio)}</ns2:municipio>
            else ()
        }
        {
            if ($payloadRequest/ns1:orip)
            then <ns2:orip>{fn:data($payloadRequest/ns1:orip)}</ns2:orip>
            else ()
        }
        {
            if ($payloadRequest/ns1:estado)
            then <ns2:estado>{fn:data($payloadRequest/ns1:estado)}</ns2:estado>
            else ()
        }
        {
            if ($payloadRequest/ns1:numeroMatricula)
            then <ns2:numeroMatricula>{fn:data($payloadRequest/ns1:numeroMatricula)}</ns2:numeroMatricula>
            else ()
        }
        <ns2:tipoDocumento>{fn:data($payloadRequest/ns1:tipoDocumento)}</ns2:tipoDocumento>
        <ns2:numeroDocumento>{fn:data($payloadRequest/ns1:numeroDocumento)}</ns2:numeroDocumento>
        {
            if ($payloadRequest/ns1:primerNombre)
            then <ns2:primerNombre>{fn:data($payloadRequest/ns1:primerNombre)}</ns2:primerNombre>
            else ()
        }
        {
            if ($payloadRequest/ns1:segundoNombre)
            then <ns2:segundoNombre>{fn:data($payloadRequest/ns1:segundoNombre)}</ns2:segundoNombre>
            else ()
        }
        {
            if ($payloadRequest/ns1:primerApellido)
            then <ns2:primerApellido>{fn:data($payloadRequest/ns1:primerApellido)}</ns2:primerApellido>
            else ()
        }
        {
            if ($payloadRequest/ns1:segundoApellido)
            then <ns2:segundoApellido>{fn:data($payloadRequest/ns1:segundoApellido)}</ns2:segundoApellido>
            else ()
        }
        {
            if ($payloadRequest/ns1:razonSocial)
            then <ns2:razonSocial>{fn:data($payloadRequest/ns1:razonSocial)}</ns2:razonSocial>
            else ()
        }
        <ns2:cantidadRegistrosPagina>{fn:data($payloadRequest/ns1:cantidadRegistrosPagina)}</ns2:cantidadRegistrosPagina>
        <ns2:ultimoIdAlerta>{fn:data($payloadRequest/ns1:ultimoIdAlerta)}</ns2:ultimoIdAlerta>
        
    </ns2:entradaConsultarAlerta>
};

local:func($payloadRequest)