# diethering 

function dither(img::AbstractArray{<:Colorant})
    n,m = size(img)
    
    for i in 2:n-1
        for j in 2:m-1
            old_pixel = img[i,j]
            new_pixel = round(old_pixel*256)/256
            img[i,j] = new_pixel
            err = old_pixel - new_pixel
            img[i+1, j] += err*(7.0/16)
            img[i-1, j+1] += err*(3.0/16)
            img[i, j+1] += err*(5.0/16)
            img[i+1, j+1] += err*(1.0/16)
        end
    end
    return img
end
