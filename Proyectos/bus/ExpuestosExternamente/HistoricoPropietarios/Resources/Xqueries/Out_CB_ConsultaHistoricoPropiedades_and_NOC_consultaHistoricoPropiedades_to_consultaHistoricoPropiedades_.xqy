xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://historicopropietarios.snr.gov.co/";
(:: import schema at "../Schemas/Legacy/HistoricoPropietarioService.xsd_1.xsd" ::)
declare namespace ns3="https://www.supernotariado.gov.co/services/bachue/ee/cb/SBB_CB_HistoricoPropietarios/consultarHistoricoPropiedades/v1";
(:: import schema at "../Schemas/EE_HP_consultarHistoricoPropiedades.xsd" ::)
declare namespace ns1="https://www.supernotariado.gov.co/services/bachue/cb/SBB_CB_HistoricoPropietarios/consultarHistoricoPropiedades/v1";
(:: import schema at "../Schemas/Legacy/CB_HP_consultarHistoricoPropiedades.xsd" ::)

declare variable $payloadCBResponse as element() (:: schema-element(ns1:salidaConsultarHistoricoPropiedades) ::) external;
declare variable $payloadNOCResponse as element() (:: schema-element(ns2:consultarHistoricoPropietarioResponse) ::) external;

declare function local:func($payloadCBResponse as element() (:: schema-element(ns1:salidaConsultarHistoricoPropiedades) ::),
$payloadNOCResponse as element() (:: schema-element(ns2:consultarHistoricoPropietarioResponse) ::))
as element() (:: schema-element(ns3:salidaConsultarHistoricoPropiedades) ::) {
<ns3:salidaConsultarHistoricoPropiedades>
{
for $propietarios in $payloadCBResponse/ns1:propietarios
return
<ns3:propietarios>
{
for $historicoMatriculas in $propietarios/ns1:historicoMatriculas
return
<ns3:historicoMatriculas>
{
if ($historicoMatriculas/ns1:numAnotacion)
then <ns3:numAnotacion>{fn:data($historicoMatriculas/ns1:numAnotacion)}</ns3:numAnotacion>
else ()
}
{
if ($historicoMatriculas/ns1:codCirculoRegistral)
then <ns3:codCirculoRegistral>{fn:data($historicoMatriculas/ns1:codCirculoRegistral)}</ns3:codCirculoRegistral>
else ()
}
{
if ($historicoMatriculas/ns1:porcentajeParticipacion)
then <ns3:porcentajeParticipacion>{fn:data($historicoMatriculas/ns1:porcentajeParticipacion)}</ns3:porcentajeParticipacion>
else ()
}
{
if ($historicoMatriculas/ns1:fechaDesde)
then <ns3:fechaDesde>{fn:data($historicoMatriculas/ns1:fechaDesde)}</ns3:fechaDesde>
else ()
}
{
if ($historicoMatriculas/ns1:fechaHasta)
then <ns3:fechaHasta>{fn:data($historicoMatriculas/ns1:fechaHasta)}</ns3:fechaHasta>
else ()
}
{
if ($historicoMatriculas/ns1:numMatriculaInmobiliaria)
then <ns3:numMatriculaInmobiliaria>{fn:data($historicoMatriculas/ns1:numMatriculaInmobiliaria)}</ns3:numMatriculaInmobiliaria>
else ()
}
{
if ($historicoMatriculas/ns1:NUPRE)
then <ns3:NUPRE>{fn:data($historicoMatriculas/ns1:NUPRE)}</ns3:NUPRE>
else ()
}</ns3:historicoMatriculas>
}
{
if ($propietarios/ns1:tipoDocumentoPersona)
then <ns3:tipoDocumentoPersona>{fn:data($propietarios/ns1:tipoDocumentoPersona)}</ns3:tipoDocumentoPersona>
else ()
}
{
if ($propietarios/ns1:numDocumentoPersona)
then <ns3:numDocumentoPersona>{fn:data($propietarios/ns1:numDocumentoPersona)}</ns3:numDocumentoPersona>
else ()
}
{
if ($propietarios/ns1:numNIT)
then <ns3:numNIT>{fn:data($propietarios/ns1:numNIT)}</ns3:numNIT>
else ()
}
{
if ($propietarios/ns1:primerApellido)
then <ns3:primerApellido>{fn:data($propietarios/ns1:primerApellido)}</ns3:primerApellido>
else ()
}
{
if ($propietarios/ns1:primerNombre)
then <ns3:primerNombre>{fn:data($propietarios/ns1:primerNombre)}</ns3:primerNombre>
else ()
}
{
if ($propietarios/ns1:segundoApellido)
then <ns3:segundoApellido>{fn:data($propietarios/ns1:segundoApellido)}</ns3:segundoApellido>
else ()
}
{
if ($propietarios/ns1:segundoNombre)
then <ns3:segundoNombre>{fn:data($propietarios/ns1:segundoNombre)}</ns3:segundoNombre>
else ()
}
{
if ($propietarios/ns1:razonSocial)
then <ns3:razonSocial>{fn:data($propietarios/ns1:razonSocial)}</ns3:razonSocial>
else ()
}
</ns3:propietarios>
}
    {
        if ($payloadCBResponse/ns1:codMensaje)
        then <ns3:codMensaje>{fn:data($payloadCBResponse/ns1:codMensaje)}</ns3:codMensaje>
        else ()
    }
{
for $propietarios in $payloadNOCResponse/return/propietarios
return
<ns3:propietarios>
{
for $historicoMatriculas in $propietarios/historicoMatriculas
return
<ns3:historicoMatriculas>
{
if ($historicoMatriculas/anotacion)
then <ns3:numAnotacion>{fn:data($historicoMatriculas/anotacion)}</ns3:numAnotacion>
else ()
}
{
if ($historicoMatriculas/circulo)
then <ns3:codCirculoRegistral>{fn:data($historicoMatriculas/circulo)}</ns3:codCirculoRegistral>
else ()
}
{
if ($historicoMatriculas/fechaDesde)
then <ns3:fechaDesde>{fn:data($historicoMatriculas/fechaDesde)}</ns3:fechaDesde>
else ()
}
{
if ($historicoMatriculas/fechaHasta)
then <ns3:fechaHasta>{fn:data($historicoMatriculas/fechaHasta)}</ns3:fechaHasta>
else ()
}
{
if ($historicoMatriculas/matricula)
then <ns3:numMatriculaInmobiliaria>{fn:data($historicoMatriculas/matricula)}</ns3:numMatriculaInmobiliaria>
else ()
}</ns3:historicoMatriculas>
}
{
if ($propietarios/tipoDocumento)
then <ns3:tipoDocumentoPersona>{fn:data($propietarios/tipoDocumento)}</ns3:tipoDocumentoPersona>
else ()
}
{
if ($propietarios/numeroDocumento)
then <ns3:numDocumentoPersona>{fn:data($propietarios/numeroDocumento)}</ns3:numDocumentoPersona>
else ()
}
{
if ($propietarios/primerApellido)
then <ns3:primerApellido>{fn:data($propietarios/primerApellido)}</ns3:primerApellido>
else ()
}
{
if ($propietarios/primerNombre)
then <ns3:primerNombre>{fn:data($propietarios/primerNombre)}</ns3:primerNombre>
else ()
}
{
if ($propietarios/segundoApellido)
then <ns3:segundoApellido>{fn:data($propietarios/segundoApellido)}</ns3:segundoApellido>
else ()
}
{
if ($propietarios/segundoNombre)
then <ns3:segundoNombre>{fn:data($propietarios/segundoNombre)}</ns3:segundoNombre>
else ()
}
{
if ($propietarios/razonSocial)
then <ns3:razonSocial>{fn:data($propietarios/razonSocial)}</ns3:razonSocial>
else ()
}
</ns3:propietarios>
}
</ns3:salidaConsultarHistoricoPropiedades>
};

local:func($payloadCBResponse, $payloadNOCResponse)