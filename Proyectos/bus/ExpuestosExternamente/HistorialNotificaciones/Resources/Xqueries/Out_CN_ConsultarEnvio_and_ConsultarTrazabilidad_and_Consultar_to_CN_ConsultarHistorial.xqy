xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/cn/mensajero/consultarenvio/v1";
(:: import schema at "../../../Mensajero/Resources/Schemas/Legacy/CN_MB_ConsultarEnvio.xsd" ::)
declare namespace ns4="https://www.supernotariado.gov.co/schemas/bachue/ee/historialNotificaciones/consultarHistorial/v1";
(:: import schema at "../Schemas/EE_HN_consultarHistorial.xsd" ::)
declare namespace ns3="https://www.supernotariado.gov.co/schemas/bachue/hn/busquedadocumentos/consultar/v1";
(:: import schema at "../Schemas/EE_Consultar.xsd" ::)
declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/hn/consultatrazabilidad/consultartrazabilidad/v1";
(:: import schema at "../Schemas/EE_ConsultarTrazabilidad.xsd" ::)

declare namespace ns5 = "https://www.supernotariado.gov.co/schemas/bachue/cb/consultatrazabilidad/consultartrazabilidad/v1";

declare namespace ns6 = "https://www.supernotariado.gov.co/schemas/bachue/co/busquedadocumentos/consultar/v1";

declare variable $payloadResponse_ConsultarEnvio as element() (:: schema-element(ns1:salidaConsultarEnvio) ::) external;
declare variable $payloadResponse_ConsultarTrazabilidad as element() (:: schema-element(ns2:GeneralList) ::) external;
declare variable $payloadResponse_Consultar as element() (:: schema-element(ns3:GeneralList) ::) external;

declare function local:func($payloadResponse_ConsultarEnvio as element() (:: schema-element(ns1:salidaConsultarEnvio) ::), 
                            $payloadResponse_ConsultarTrazabilidad as element() (:: schema-element(ns2:GeneralList) ::), 
                            $payloadResponse_Consultar as element() (:: schema-element(ns3:GeneralList) ::)) 
                            as element() (:: schema-element(ns4:salidaConsultarHistorial) ::) {
<ns4:salidaConsultarHistorial>
        {
            if ($payloadResponse_ConsultarEnvio/ns1:numeroRegistros)
            then <ns4:numeroRegistros>{fn:data($payloadResponse_ConsultarEnvio/ns1:numeroRegistros)}</ns4:numeroRegistros>
            else ()
        }
	<ns4:listaMensajes>
            {
                for $mensaje in $payloadResponse_ConsultarEnvio/ns1:listaMensajes/ns1:mensaje
                return 
		<ns4:mensaje>
                    {
                        if ($mensaje/ns1:nir)
                        then <ns4:nir>{fn:data($mensaje/ns1:nir)}</ns4:nir>
                        else ()
                    }
                    {
                        if ($mensaje/ns1:turno)
                        then <ns4:turno>{fn:data($mensaje/ns1:turno)}</ns4:turno>
                        else ()
                    }
                    {
                        if ($mensaje/ns1:orip)
                        then <ns4:orip>{fn:data($mensaje/ns1:orip)}</ns4:orip>
                        else ()
                    }
                    {
                        if ($mensaje/ns1:identificadorEE)
                        then <ns4:identificadorEE>{fn:data($mensaje/ns1:identificadorEE)}</ns4:identificadorEE>
                        else ()
                    }
                    {
                        if ($mensaje/ns1:fechaEnvio)
                        then <ns4:fechaEnvio>{fn:data($mensaje/ns1:fechaEnvio)}</ns4:fechaEnvio>
                        else ()
                    }


			<ns4:tipoTramiteCurso>{fn:data($payloadResponse_ConsultarTrazabilidad/ns5:salidaConsultarTrazabilidad[$payloadResponse_ConsultarTrazabilidad/ns5:salidaConsultarTrazabilidad/ns5:nir=$mensaje/ns1:nir]/ns5:elementosnir/ns5:elementonir/ns5:procesoTurno)}</ns4:tipoTramiteCurso>

                    {
                        if ($mensaje/ns1:asunto)
                        then <ns4:asunto>{fn:data($mensaje/ns1:asunto)}</ns4:asunto>
                        else ()
                    }
                    {
                        if ($mensaje/ns1:cuerpo)
                        then <ns4:cuerpo>{fn:data($mensaje/ns1:cuerpo)}</ns4:cuerpo>
                        else ()
                    }
                    {
                        if ($mensaje/ns1:para)
                        then <ns4:para>{fn:data($mensaje/ns1:para)}</ns4:para>
                        else ()
                    }

                    {



                                    for $documento in $payloadResponse_Consultar/ns6:salidaConsultar/ns6:documentos/ns6:documento
                                    return 
                                
                                if ($payloadResponse_Consultar/ns6:salidaConsultar/ns6:documentos/ns6:documento/ns6:nir=$mensaje/ns1:nir)
                                then
                                    <ns4:tipoDocumental>
                                                  
                                       {
                                            if ($payloadResponse_Consultar/ns6:salidaConsultar/ns6:documentos/ns6:documento/ns6:tipoDocumental)
                                            then <ns4:nomTipoDocumentoPublico>{fn:data($payloadResponse_Consultar/ns6:salidaConsultar/ns6:documentos/ns6:documento/ns6:tipoDocumental[$payloadResponse_Consultar/ns6:salidaConsultar/ns6:documentos/ns6:documento/ns6:nir=$mensaje/ns1:nir])}</ns4:nomTipoDocumentoPublico>
                                            else ()
                                            
                                        }
                                    </ns4:tipoDocumental>
                                else ()


                            }
		</ns4:mensaje>
            }


	</ns4:listaMensajes>
    <ns4:codMensaje>{fn:data($payloadResponse_ConsultarTrazabilidad/ns5:salidaConsultarTrazabilidad/ns5:codigoMensaje)}</ns4:codMensaje>
    {
        if ($payloadResponse_ConsultarTrazabilidad/ns5:salidaConsultarTrazabilidad/ns5:descripcionMensaje)
        then <ns4:descripcionMensaje>{fn:data($payloadResponse_ConsultarTrazabilidad/ns5:salidaConsultarTrazabilidad/ns5:descripcionMensaje)}</ns4:descripcionMensaje>
        else ()
    }
</ns4:salidaConsultarHistorial>
};

local:func($payloadResponse_ConsultarEnvio, $payloadResponse_ConsultarTrazabilidad, $payloadResponse_Consultar)
