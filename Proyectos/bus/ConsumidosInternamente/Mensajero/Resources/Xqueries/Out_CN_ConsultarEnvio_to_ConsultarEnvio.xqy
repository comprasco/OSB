xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/cn/mensajero/consultarenvio/v1";
(:: import schema at "../Schemas/Legacy/CN_MB_ConsultarEnvio.xsd" ::)

declare variable $payloadResponse as element() (:: schema-element(ns1:salidaConsultarEnvio) ::) external;

declare function local:func($payloadResponse as element() (:: schema-element(ns1:salidaConsultarEnvio) ::)) as element() (:: schema-element(ns1:salidaConsultarEnvio) ::) {
    <ns1:salidaConsultarEnvio>
        {
            if ($payloadResponse/ns1:numeroRegistros)
            then <ns1:numeroRegistros>{fn:data($payloadResponse/ns1:numeroRegistros)}</ns1:numeroRegistros>
            else ()
        }
        {
            if ($payloadResponse/ns1:listaMensajes)
            then 
                <ns1:listaMensajes>
                    {
                        for $mensaje in $payloadResponse/ns1:listaMensajes/ns1:mensaje
                        return 
                        <ns1:mensaje>
                            {
                                if ($mensaje/ns1:nir)
                                then <ns1:nir>{fn:data($mensaje/ns1:nir)}</ns1:nir>
                                else ()
                            }
                            {
                                if ($mensaje/ns1:turno)
                                then <ns1:turno>{fn:data($mensaje/ns1:turno)}</ns1:turno>
                                else ()
                            }
                            {
                                if ($mensaje/ns1:orip)
                                then <ns1:orip>{fn:data($mensaje/ns1:orip)}</ns1:orip>
                                else ()
                            }
                            {
                                if ($mensaje/ns1:identificadorEE)
                                then <ns1:identificadorEE>{fn:data($mensaje/ns1:identificadorEE)}</ns1:identificadorEE>
                                else ()
                            }
                            {
                                if ($mensaje/ns1:fechaEnvio)
                                then <ns1:fechaEnvio>{fn:data($mensaje/ns1:fechaEnvio)}</ns1:fechaEnvio>
                                else ()
                            }
                            {
                                if ($mensaje/ns1:asunto)
                                then <ns1:asunto>{fn:data($mensaje/ns1:asunto)}</ns1:asunto>
                                else ()
                            }
                            {
                                if ($mensaje/ns1:cuerpo)
                                then <ns1:cuerpo>{fn:data($mensaje/ns1:cuerpo)}</ns1:cuerpo>
                                else ()
                            }
                            {
                                if ($mensaje/ns1:para)
                                then <ns1:para>{fn:data($mensaje/ns1:para)}</ns1:para>
                                else ()
                            }
                            {
                                if ($mensaje/ns1:documentos)
                                then 
                                    <ns1:documentos>
                                        {
                                            for $documento in $mensaje/ns1:documentos/ns1:documento
                                            return 
                                            <ns1:documento>
                                                {
                                                    if ($documento/ns1:dID)
                                                    then <ns1:dID>{fn:data($documento/ns1:dID)}</ns1:dID>
                                                    else ()
                                                }
                                                {
                                                    if ($documento/ns1:dDocName)
                                                    then <ns1:dDocName>{fn:data($documento/ns1:dDocName)}</ns1:dDocName>
                                                    else ()
                                                }
                                            </ns1:documento>
                                        }
                                    </ns1:documentos>
                                else ()
                            }
                        </ns1:mensaje>
                    }
                </ns1:listaMensajes>
            else ()
        }
        <ns1:codMensaje>{fn:data($payloadResponse/ns1:codMensaje)}</ns1:codMensaje>
        {
            if ($payloadResponse/ns1:codMensaje=200)
            then <ns1:descripcionMensaje>{'OK'}</ns1:descripcionMensaje>
            else (
            <ns1:descripcionMensaje>{fn:data($payloadResponse/ns1:descripcionMensaje)}</ns1:descripcionMensaje>
            )
        }
        
    </ns1:salidaConsultarEnvio>
};

local:func($payloadResponse)
