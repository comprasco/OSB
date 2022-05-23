xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/cb/gestionalertastitulares/consultaralerta/v1";
(:: import schema at "../Schemas/Legacy/CB_GAT_ConsultarAlerta.xsd" ::)
declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/ee/gestionalertastitulares/consultaralerta/v1";
(:: import schema at "../Schemas/EE_GAT_ConsultarAlerta.xsd" ::)

declare variable $payloadResponse as element() (:: schema-element(ns1:salidaConsultarAlerta) ::) external;

declare function local:func($payloadResponse as element() (:: schema-element(ns1:salidaConsultarAlerta) ::)) as element() (:: schema-element(ns2:salidaConsultarAlerta) ::) {
    <ns2:salidaConsultarAlerta>
        
        <ns2:alertas>
            {
                for $alerta in $payloadResponse/ns1:alertas/ns1:alerta
                return 
                <ns2:alerta>
                    <ns2:identificadorAlerta>{fn:data($alerta/ns1:identificadorAlerta)}</ns2:identificadorAlerta>
                    <ns2:numeroMatricula>{fn:data($alerta/ns1:numeroMatricula)}</ns2:numeroMatricula>
                    <ns2:direccion>{fn:data($alerta/ns1:direccion)}</ns2:direccion>
                    <ns2:fechaVigencia>{fn:data($alerta/ns1:fechaVigencia)}</ns2:fechaVigencia>
                    <ns2:departamento>{fn:data($alerta/ns1:departamento)}</ns2:departamento>
                    <ns2:municipio>{fn:data($alerta/ns1:municipio)}</ns2:municipio>
                    <ns2:orip>{fn:data($alerta/ns1:orip)}</ns2:orip>
                    <ns2:nombreOrip>{fn:data($alerta/ns1:nombreOrip)}</ns2:nombreOrip>
                    <ns2:estado>{fn:data($alerta/ns1:estado)}</ns2:estado></ns2:alerta>
            }
        </ns2:alertas>
        <ns2:codigoMensaje>{fn:data($payloadResponse/ns1:codigoMensaje)}</ns2:codigoMensaje>
        {
            if ($payloadResponse/ns1:descripcionMensaje)
            then <ns2:descripcionMensaje>{fn:data($payloadResponse/ns1:descripcionMensaje)}</ns2:descripcionMensaje>
            else ()
        }
    </ns2:salidaConsultarAlerta>
};

local:func($payloadResponse)