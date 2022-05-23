xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/cb/consultagenerica/consultar/v1";
(:: import schema at "../Schemas/Legacy/CB_CG_Consultar.xsd" ::)
declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/ee/consultagenerica/consultar/v1";
(:: import schema at "../Schemas/EE_CG_Consultar.xsd" ::)

declare variable $payloadRequest as element() (:: schema-element(ns1:entradaConsultar) ::) external;

declare function local:func($payloadRequest as element() (:: schema-element(ns1:entradaConsultar) ::)) as element() (:: schema-element(ns2:entradaConsultar) ::) {
    <ns2:entradaConsultar>
        <ns2:modulo>{fn:data($payloadRequest/ns1:modulo)}</ns2:modulo>
        <ns2:funcionalidad>{fn:data($payloadRequest/ns1:funcionalidad)}</ns2:funcionalidad>
        
        <ns2:parametros>
            {
                for $parametro in $payloadRequest/ns1:parametros/ns1:parametro
                return 
                <ns2:parametro>
                    <ns2:nombre>{fn:data($parametro/ns1:nombre)}</ns2:nombre>
                    <ns2:valor>{fn:data($parametro/ns1:valor)}</ns2:valor></ns2:parametro>
            }
        </ns2:parametros>
    </ns2:entradaConsultar>
};

local:func($payloadRequest)