xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://glass.aac.step.org/";
(:: import schema at "../Schemas/Legacy/ServicioEstadoTramite.xsd_1.xsd" ::)
declare namespace ns2="http://www.gobiernoenlinea.gov.co/GEL-XML/1.0/schemas/integracion/supernotariado/bachue";
(:: import schema at "../Schemas/EE_CT_ConsultarTrazabilidadNOC.xsd" ::)

declare variable $payloadResponse as element() (:: schema-element(ns1:consultaEstadoTramiteResponse) ::) external;

declare function local:func($payloadResponse as element() (:: schema-element(ns1:consultaEstadoTramiteResponse) ::)) as element() (:: schema-element(ns2:salidaTrazabilidadTramiteRegistroNodoCentral) ::) {
    <ns2:salidaTrazabilidadTramiteRegistroNodoCentral>
        <codDepartamento>{fn:data($payloadResponse/return/entidad/localizacion/departamento/codDepartamento)}</codDepartamento>
        <nomDepartamento>{fn:data($payloadResponse/return/entidad/localizacion/departamento/nomDepartamento)}</nomDepartamento>
        <codMunicipio>{fn:data($payloadResponse/return/entidad/localizacion/municipio/codMunicipio)}</codMunicipio>
        <nomMunicipio>{fn:data($payloadResponse/return/entidad/localizacion/municipio/nomMunicipio)}</nomMunicipio>
        <oficinaOrigen>{fn:data($payloadResponse/return/entidad/nombre)}</oficinaOrigen>
        {
            for $listaEstadosTramite in $payloadResponse/return/estadosTramite/listaEstadosTramite
            return 
            <estadosTramite>
                <codigoEstado>{fn:data($listaEstadosTramite/codigo)}</codigoEstado>
                <fechaInicioEtapa>{fn:data($listaEstadosTramite/fecha)}</fechaInicioEtapa>
                <pasoPorEstado>{fn:data($listaEstadosTramite/pasoPorEstado)}</pasoPorEstado>
            </estadosTramite>
        }
        <fechaHoraConsulta>{fn:data($payloadResponse/return/fechaConsulta)}</fechaHoraConsulta>
        <fechaRadicacion>{fn:data($payloadResponse/return/fechaRadicacion)}</fechaRadicacion>
        <fechaInstrumento>{fn:data($payloadResponse/return/instrumento/fecha)}</fechaInstrumento>
        <numeroInstrumento>{fn:data($payloadResponse/return/instrumento/numero)}</numeroInstrumento>
        <nomTipoDocumentoPublico>{fn:data($payloadResponse/return/instrumento/tipo)}</nomTipoDocumentoPublico>
        <descripcionMensaje>{fn:data($payloadResponse/return/mensaje)}</descripcionMensaje>
        <numeroConsulta>{fn:data($payloadResponse/return/numeroConsulta)}</numeroConsulta>
    </ns2:salidaTrazabilidadTramiteRegistroNodoCentral>
};

local:func($payloadResponse)
