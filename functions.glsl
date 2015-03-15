float hash( float n ) { return fract(sin(n)*43758.5453123); }

float noise( in vec3 x )
{
    vec3 p = floor(x);
    vec3 f = fract(x);
    f = f*f*(3.0-2.0*f);
	
    float n = p.x + p.y*157.0 + 113.0*p.z;
    return mix(mix(mix( hash(n+  0.0), hash(n+  1.0),f.x),
                   mix( hash(n+157.0), hash(n+158.0),f.x),f.y),
               mix(mix( hash(n+113.0), hash(n+114.0),f.x),
                   mix( hash(n+270.0), hash(n+271.0),f.x),f.y),f.z);
}

vec2 getUv(in vec2 fragCoord) {
    return fragCoord.xy / iResolution.xy;
}

vec2 getNdc(in vec2 fragCoord) {
    return getUv(fragCoord) * 2.0 - vec2(1.0);
}

vec2 getNdcAspect(in vec2 fragCoord) {
    float aspect = iResolution.x / iResolution.y;
    vec2 ndc = getNdc(fragCoord);
    if (aspect > 1.0) {
        ndc.x *= aspect;
    } else {
        ndc.y /= aspect;
    }
    return ndc;
}

