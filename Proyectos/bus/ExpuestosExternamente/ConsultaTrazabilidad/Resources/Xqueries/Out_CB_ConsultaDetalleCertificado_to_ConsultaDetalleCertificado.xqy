xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/cb/consultatrazabilidad/consultaDetalleCertificado/v1";
(:: import schema at "../Schemas/Legacy/CB_CT_ConsultaDetalleCertificado.xsd" ::)
declare namespace v1="https://www.supernotariado.gov.co/schemas/bachue/ee/consultatrazabilidad/consultaDetalleCertificado/v1";
(:: import schema at "../Schemas/EE_CT_ConsultaDetalleCertificado.xsd" ::)

declare variable $payloadResponse as element() (:: schema-element(ns1:salidaConsultaDetalleCertificado) ::) external;

declare function local:func($payloadResponse as element() (:: schema-element(ns1:salidaConsultaDetalleCertificado) ::)) as element() (:: schema-element(v1:salidaConsultaDetalleCertificado) ::) {
    <v1:salidaConsultaDetalleCertificado>
        <v1:nir>{fn:data($payloadResponse/ns1:nir)}</v1:nir>
        <v1:certificados>
            {
                for $certificado in $payloadResponse/ns1:certificados/ns1:certificado
                return 
                <v1:certificado>
                    <v1:proceso>{fn:data($certificado/ns1:proceso)}</v1:proceso>
                    <v1:subproceso>{fn:data($certificado/ns1:subproceso)}</v1:subproceso>
                    <v1:nombre>{fn:data($certificado/ns1:nombre)}</v1:nombre>
                    <v1:codCirculoRegistral>{fn:data($certificado/ns1:codCirculoRegistral)}</v1:codCirculoRegistral>
                    <v1:numMatriculaInmobiliaria>{fn:data($certificado/ns1:numMatriculaInmobiliaria)}</v1:numMatriculaInmobiliaria>
                    <v1:tipoTarifa>{fn:data($certificado/ns1:tipoTarifa)}</v1:tipoTarifa>
                    <v1:cantidad>{fn:data($certificado/ns1:cantidad)}</v1:cantidad>
                    <v1:valor>{fn:data($certificado/ns1:valor)}</v1:valor>
                    <v1:valorTotal>{fn:data($certificado/ns1:valorTotal)}</v1:valorTotal></v1:certificado>
            }
        </v1:certificados>
        
         
        
        <v1:codigoMensaje>{fn:data($payloadResponse/ns1:codigoMensaje)}</v1:codigoMensaje>
        <v1:descripcionMensaje>{fn:data($payloadResponse/ns1:descripcionMensaje)}</v1:descripcionMensaje>
    </v1:salidaConsultaDetalleCertificado>
};

local:func($payloadResponse)
